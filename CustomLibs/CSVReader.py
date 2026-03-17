import csv

def read_csv_file(filename):
    data = []
    with open (filename,'rb') as csvfile: #'rb' to read file
        reader = csv.reader(csvfile)
        for row in reader:
            data.append(row)
        
    return data