module AppsHelper

  def format_name(app)
    if app.name.length > 25
      "#{app.name[0..24]}..."
    else
      app.name
    end
  end

end
