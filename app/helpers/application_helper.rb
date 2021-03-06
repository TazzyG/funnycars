module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Rocky Mountain Floppers"
    meta = "Rocky Mountain Floppers"
    if page_title.empty?
      base_title + ":" + meta
    else
      page_title + " | " + base_title
    end
  end
  
  def display_poster_with_link(post)
  		link_to image_tag(post.picture.url(:medium)), post
  end
  
  def active_class(link_path)
    current_page?(link_path) ? 'active' : ""
  end
  
end
