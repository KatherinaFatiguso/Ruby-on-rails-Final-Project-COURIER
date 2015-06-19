class TaskDecorator < Draper::Decorator
  delegate_all

  def created_at
    object.created_at.localtime.strftime("%A, %d %b %Y %l:%M %p %Z")
  end

  def updated_at
    object.updated_at.localtime.strftime("%A, %d %b %Y %l:%M %p %Z")
  end

  def label
    if object.sign_required?
      if !(object.signed?)
        h.content_tag(:span, "Not Signed", class: "label label-warning")
      end
    end

  end
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
