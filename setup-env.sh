# Prepare the shell to use Conda commands.
conda init

# Bypasses the "CondaSSLError" on EY Windows laptops 
# Why: "proxy services that use Man-In-The-Middle (MITM) attacks to sniff encrypted traffic. These services can interfere with SSL connections"
# https://docs.conda.io/projects/conda/en/latest/user-guide/configuration/disable-ssl-verification.html
conda config --set ssl_verify false

# Create the Conda environment
conda env create --file=env.yml

# Turn SSL verification back on as recommended by Conda.
conda config --set ssl_verify true

# Activate the environment
source activate dev-env