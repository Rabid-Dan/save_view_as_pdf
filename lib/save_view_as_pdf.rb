class SaveViewAsPdf
  attr_reader :pdf
  def initialize
    @pdf = build_rendered_pdf(html: render_to_string(:print, formats: [:html]))
  end

  def self.download(filename)
    send_file(pdf.file_path, filename: filename, type: pdf.mime_type)
  end

  private 

  def build_rendered_pdf(html:)
    renderer = PdfRenderingService.new(from_html: html)
    renderer.render
    renderer.pdf
  end  
end