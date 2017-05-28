module ApplicationHelper
  def full_title(page_title = '')
    base_title = "RockyMountainFloppers"
    meta = "Nostalgia Funny Cars"
    if page_title.empty?
      base_title + ":" + meta
    else
      page_title + " | " + base_title
    end
  end
  
  def active_class(link_path)
    current_page?(link_path) ? 'active' : ""
  end
end
