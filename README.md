# Multilingual versions of the Periodic table of elements
A printable Periodic table of element in multiple languages written in Tex / LaTeX.

## 1. Download
All PDF files are in the ```output``` folder.
Files are prefixed with the language of the table.


## 2. Project
The table is based on Ivan Griffin's and Paul Danese's creations and edits of a Latex Periodic table of elements.

This project introduce different versions to the original tables: various level of details and multiple languages.


## 3. Versions

### Languages
For now the table is available in:
- English
- French
- Russian

### Details
Files suffixed with ```extra``` have extra informations: labels of groups and periods, more detailed colored categories of elements.


## 4. Contribute
The Tex files are:
- ```periodic_table.tex```
- ```languages.tex```

After editing one of these files you can build the PDF using ```Make```.
For example to build every files with all the different options, you can run ```make``` or ```make all```

To build files for a specific language you would have to run ```make fr```


### Add a new language
1. Translations are placed in the ```languages.tex``` file. To add a new language, add to the file the Tex variables for your new language. You can take as example what was done for the first languages supported (ENGLISH, FRENCH, RUSSIAN).

2. Also some tricks need to be done in ```Makefile``` so that you would be able to run ```make nl``` (```nl``` being the newly added language) to build your work to PDF. Here too you can take as example what is done in this file for other languages.

3. To finish you can edit the ```README.md``` file to show that a new language is supported.

4. The only thing left is to open a Pull Request. :)


## 5. TODO
- Add a gh-page with download links
- Add support for new languages

