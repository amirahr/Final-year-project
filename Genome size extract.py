import os
import io
import glob
import re
import pandas as pd

#gets total length of genome in bp
work_dir = "/Users/amirahrafique/Desktop/FYP/GENOMES/Q1 - Genome size vs ecology/60 base genomes"
names_list = []
matches_list= []
for path in glob.glob(os.path.join(work_dir, "*.gbff")):
    with io.open(path, mode="r", encoding="utf-8") as file:
        first_line = file.readline()
        matches = int(re.search(r"(\d+)", first_line[33:]).group(0))
        print(matches)
    name = os.path.basename(path).replace(".gbff", "")
    names_list.append(name)
    matches_list.append(matches)
    print(names_list)

#output as file
df = pd.DataFrame({'Accession_ID':names_list, 'Genome_size': matches_list})
print(df)
df.to_csv(r'/Users/amirahrafique/Desktop/FYP/GENOMES/Q1 - Genome size vs ecology/Q1.csv', index=False)




