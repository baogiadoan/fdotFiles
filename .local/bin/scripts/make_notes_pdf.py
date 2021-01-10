#!/usr/bin/env python

import glob
import sys
import os

class_name = sys.argv[1]
home_dir = os.getenv('HOME')
prefix = home_dir + '/McGill/' + class_name + '/notes/'
files = (glob.glob(home_dir + '/McGill/' + class_name + '/notes/lectures/*.tex'))

files.sort()

new_file = []


f = open(home_dir + "/McGill/" + class_name + "/notes/" + class_name + ".tex", "r")
contents = f.readlines()
f.close()


inside = False

for line in contents:
    #print(inside)
    if "% Lecture Imports %" in line:
        inside = True
        new_file.append("% Lecture Imports %\n")

    if not inside:
        new_file.append(line)
        #print(line)

    if "% Imports End %" in line:
        inside = False
        for file in files:
            # to_append = "\import{}{" + file.replace('.tex', '') + "}"
            to_append = "\subfile{" + file.replace('.tex', '').replace(prefix, '') + "}"
            new_file.append(to_append)
            new_file.append("\n")
            #print(to_append)
        new_file.append("% Imports End %\n")
        #print("% Imports End %")

f = open(home_dir + "/McGill/" + class_name + "/notes/" + class_name + ".tex", "w")
#print(new_file)
new_file = "".join(new_file)
f.write(new_file)
f.close()

