# Prepare the shell to use Conda commands.
conda init

# Bypasses the "CondaSSLError" on EY Windows laptops 
# Why: "proxy services that use Man-In-The-Middle (MITM) attacks to sniff encrypted traffic. These services can interfere with SSL connections"
# https://docs.conda.io/projects/conda/en/latest/user-guide/configuration/disable-ssl-verification.html
conda config --set ssl_verify false

# Verbose logging for detailed dependency resolution information
conda config --set verbosity 2

# Ensure the package index can vary flexibly
conda config --set channel_priority flexible

# Preemptively configure this pip environment variable to write over user prompts.
# This prevents pip installations within conda from hanging. 
PIP_EXISTS_ACTION=w

# Create the Conda environment
conda env create --file=env.yml

# Turn SSL verification back on as recommended by Conda
conda config --set ssl_verify true

# Reset logging verbosity
conda config --set verbosity 0

# Activate the environment
source activate dev_env