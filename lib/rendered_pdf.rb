class RenderedPdf
  attr_reader :file_path

  def initialize(file_path:)
    @file_path = file_path
  end

  def mime_type
    "application/pdf"
  end
end
