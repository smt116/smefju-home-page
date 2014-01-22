wget http://mattmahoney.net/dc/text8.zip -O text8.gz
gunzip text8.gz
tr --delete '[:alnum:][:blank:]' < text8 > deleted.txt
rm deleted.txt
tr --squeeze-repeats '[:blank:]' '\n' < text8 > text8.txt
rm text8
