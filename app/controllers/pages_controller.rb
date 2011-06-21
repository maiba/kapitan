class PagesController < ApplicationController

  # This action is usually accessed with the root path, normally '/'
  def home
    @skip_crumbs = true
    error_404 unless (@page = Page.where(:link_url => '/').first).present?
  end

  # This action can be accessed normally, or as nested pages.
  # Assuming a page named "mission" that is a child of "about",
  # you can access the pages with the following URLs:
  #
  #   GET /pages/about
  #   GET /about
  #
  #   GET /pages/mission
  #   GET /about/mission
  #
  def show
    page_path = "#{params[:path]}/#{params[:id]}".split('/')
    @page = Page.find(page_path.last)
    @show_bottom_part = !!@page.show_in_left_menu
    page_path.each_with_index do |p_part, i|
      p = Page.find(p_part)
      add_crumb p.title, "/" + page_path[0..i].join('/')
    end
    if @page.try(:live?) || (refinery_user? && current_user.authorized_plugins.include?("refinery_pages"))
      # if the admin wants this to be a "placeholder" page which goes to its first child, go to that instead.
      if @page.skip_to_first_child && (first_live_child = @page.children.order('lft ASC').where(:draft=>false).first).present?
        redirect_to first_live_child.url
      elsif @page.link_url.present?
        redirect_to @page.link_url and return
      end
    else
      error_404
    end
  end

end
