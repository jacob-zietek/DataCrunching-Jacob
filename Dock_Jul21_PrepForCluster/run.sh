#!/bin/bash
#
# Example Frontera job script
# ---------------------------
#
# We want to run 1 run_node_set.sh script on every node (which internally
# will use multithreading for load balancing).
#
#SBATCH -J orf7a_jzietek        # Job name
#SBATCH -o orf7a_jzietek.o%j    # Name of stdout output file
#SBATCH -e orf7a_jzietek.e%j    # Name of stderr error file
#SBATCH -p long            # Queue (partition) name
#SBATCH -N 1               # Total # of nodes 
#SBATCH -n 1               # Total # of mpi tasks
#SBATCH -t 08:00:00        # Run time (hh:mm:ss)
#SBATCH --mail-type=all    # Send email at begin and end of job
#SBATCH -A mt-24449        # Project/Allocation name (req'd if you have more than 1)
#SBATCH --mail-user=jzietek@bnl.gov
#
# DC is short for DataCrunching
#

if [ ! -d results ]
then
  mkdir results
fi

export PATH="/sdcc/covid19/sw/conda-covid19/MGLToolsPckgs/bin/:$PATH"

export PATH="/sdcc/covid19/sw/dock6/bin:$PATH"

export AUTODOCKTOOLS_UTIL="/sdcc/covid19/sw/conda-covid19/MGLToolsPckgs/AutoDockTools/Utilities24/"

export DOCK_HOME="/sdcc/covid19/sw/dock6/"

#

./example.sh
