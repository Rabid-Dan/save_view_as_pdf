class SaveViewAsPdf
  attr_reader :pdf
  def initialize
    @pdf = build_rendered_pdf(html: render_to_string(:print, formats: [:html]))
  end

  def download(filename)
    send_file(pdf.file_path, filename: filename, type: pdf.mime_type)
  end
end