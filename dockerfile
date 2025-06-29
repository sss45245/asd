# ✅ Use a stable base notebook image
FROM jupyter/scipy-notebook:latest

# ✅ Switch to root to install system dependencies
USER root

# ✅ Install Node.js for JupyterLab extensions
RUN conda install -y nodejs

# ✅ Switch back to default Jupyter user
USER ${NB_USER}

# ✅ Copy your custom postBuild script into the image
COPY binder/postBuild ./binder/postBuild

# ✅ Make sure the postBuild script is executable
RUN chmod +x binder/postBuild

# ✅ Run the postBuild steps
RUN ./binder/postBuild
