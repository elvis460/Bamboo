module ApplicationHelper
  def selected(a,b)
    if a.to_s == b.to_s
      return 'selected'
    end
  end

  def checked(a,b)
    if a.to_s == b.to_s
      return 'checked'
    end
  end

  def active(a,b)
    if a.to_s == b.to_s
      return 'active'
    end
  end
end
