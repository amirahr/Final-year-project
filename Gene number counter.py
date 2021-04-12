import os
import io
import glob
import re
import pandas as pd

def CDS_extract(path):
    with open(path) as file:
        while 1:
            line = file.readline()
            if line.startswith("FEATURES"):
                break
        cds_count =0
        while 1:
            line = file.readline()
            if "CDS " in line[0:21]:
                cds_count += 1
            if line.startswith("//"):
                break
        return cds_count

ID_list =[]
gene_numbers =[]
#Apply the functions
genome_dir = "/Users/amirahrafique/Desktop/FYP/GENOMES/Q1 - Genome size vs ecology/60 base genomes"
for path in glob.glob(os.path.join(genome_dir, "*.gbff")):
    ID = os.path.basename(path).split()[0]
    cds_no = CDS_extract(path)
    ID_list.append(ID)
    gene_numbers.append(cds_no)
    print(cds_no)

#Write results to a CSV
df = pd.DataFrame({'ID': ID_list, 'CDS number': gene_numbers})
df.to_csv(
    r'/Users/amirahrafique/Desktop/FYP/GENOMES/Q1 - Genome size vs ecology/gene_no.csv',
    index=False)
print(df)
