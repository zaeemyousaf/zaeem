# A simple cryptographer written in python 3
## Author: Zaeem Yousaf
### Features:  converts only ASCII characters in a file into ASCII characters

### Usage

## encrypting a file


* edit encrypt.py, go to last line and modify the parameters 

**engI** : english Increment will be just applied to english characters in a file.

**symI** : symbold Increment will be just applied to symbols in a file

**numI** : numeric Increment will be just applied to numbers in a file

**hold** : a vector that contains the letters which you want to ignore in encryption

**igPtrn**: position of a character you want to ignore at specific interval

## Example for encryption

setting parameters as below 

`encodeF(sys.argv[1],engI=1,symI=0,numI=0,hold=[a,e],igPtrn=1)`

`inputFile.txt contains following text`
<pre>
1): This is first line
2): This is second line

3): above is empty line
</pre>
* Type on Terminal in same directory
`$ python encrypt.py inputFile.txt`
* You will see output file created as inputFile_encrypted.txt which contains
<pre>
parameters	1	0	0	['a', 'e']	1
1): Tiit js fjrtt ljne
2): Tiit js secpne mioe

3): acowe it emqtz mioe
</pre>
* Interpretation of outputfile
First line contains the method used for encryption. It will be detected next time when it be decrypted.

Each first character and then each next character with interval 1 remains as such because of `igPtrn`.

symbol `)` remains as such because we didn't increment the symbol.

The letters `a` and `e` remained as such because they were in `hold` list.

Spaces remained as such because it falls in symbol category, and it is not incremented.

Empty lines remained empty. It is programmed intentionally.

## Example for decryption
* we assume that the file we are going to decrypt is already encrypted with this software

* Open Terminal and type `$ python decrypt.py inputFile_encrypted.txt`

* It will generate a decrypted file named as inputFile_decrypted.txt
