# Start from the same image you are using in your deployment
FROM abompotas/overleaf:5

# Set the repository to the main 2024 archive, update tlmgr, 
# and then install the recommended package collections.
RUN tlmgr option repository ftp://tug.org/historic/systems/texlive/2024/tlnet-final && \
    tlmgr update --self && \
    tlmgr install collection-latexrecommended && \
    tlmgr install collection-fontsrecommended && \
    tlmgr install collection-latexextra
