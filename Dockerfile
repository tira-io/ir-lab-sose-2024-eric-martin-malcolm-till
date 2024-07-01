# A prepared image with python3.10, java 11, ir_datasets, tira, and PyTerrier installed 
FROM webis/ir-lab-wise-2023:0.0.4

# Update pip and install required packages
RUN pip3 install --upgrade pip && \
    pip3 install --no-cache-dir tira transformers torch nltk

# Download NLTK data
RUN python3 -c "import nltk; nltk.download('punkt')"

# Set the working directory
WORKDIR /app

# Copy the notebook and any other necessary files
COPY . /app

# Make sure the notebook is in the correct location
RUN ls -la /app

# Set the default command to run the notebook
CMD ["/run-notebook.py", "--notebook", "/app/combined-combined-all-01.ipynb", "--input", "$inputDataset", "--output", "$outputDir"]