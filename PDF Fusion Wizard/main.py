from PyPDF2 import PdfFileMerger
import os

def merge_pdfs(input_folder, output_file):
    merger = PdfFileMerger()

    for filename in os.listdir(input_folder):
        if filename.endswith(".pdf"):
            pdf_path = os.path.join(input_folder, filename)
            merger.append(pdf_path)

    merger.write(output_file)
    merger.close()
    print(f"PDFs merged successfully. Result saved in: {output_file}")

if __name__ == "__main__":
    input_folder = "/PDF_to_Merge"
    output_file = "/Merged/merged.pdf"

    merge_pdfs(input_folder, output_file)
