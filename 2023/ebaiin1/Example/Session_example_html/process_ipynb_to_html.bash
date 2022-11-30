
if [ ! -d ipython-notebook ]; then
    # Example command line to install env locally:
    echo "Installing dependencies in ${PWD}/ipython-notebook"
    mamba env create -f environment.yaml -p ./ipython-notebook >> html.log 2>&1
fi 

# Example command line to activate local environment:
echo "Activating ${PWD}/ipython-notebook environment:"
conda activate --no-stack ./ipython-notebook


# Example command line to convert ipython notebooks to rst
echo "Converting ipynb to rst"
if [ -f Practice.rst ]; then
    # Remove previously compiled document
    rm --verbose Practice.rst
fi
jupyter nbconvert --to rst Practice.ipynb >> html.log 2>&1

if [ -f Theory.rst ]; then
    # Remove previously compiled document
    rm --verbose Theory.rst
fi
jupyter nbconvert --to rst Theory.ipynb >> html.log 2>&1

echo "HTML over"