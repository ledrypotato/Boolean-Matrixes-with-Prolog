<h1 align="center"> Boolean Matrixes </h1>
<br>

>## Project:
The goal of this project was to manipulate boolean matrixes in Prolog.  

Let's go over a basic example of a left product: **V** x **M**

<p align="center">
  <img src="img/basic example.PNG" width="20%" height="20%">
</p>

Consider matrixes with **n** lines and **k** columns containing boolean values: **v** (vrai = true in French) and **f** (faux = false in French).  

1. Initialise a line vector R (Result) of length **k** containing only False (f).  
2. Iterate over the elements in V (most left matrix):
- if the element *i* is False (f) then do nothing 
- if the element *i* is True (v) then add the line *i* of the second matrix M(middle one) to R  

3. After iterating over all the elements of V the vector R contains all of the lines of M that are at positions corresponding to the lines that contain True (v) in the vector V

4. XOR the columns of R. For the above example the 3rd and 4th elements in V are v's (True) which means we take the 3rd (v v) and 4th (f v) line of the matrix M.  
XOR(v, f) = v  
XOR(v, v) = f  
Hence the result (v f). 

Once this was implemented the next step was, given the matrix M, to find the vector V such as the result of V x M is a vector only containing False (f).  
Here are the possiblites for the example above.

<p align="center">
  <img src="img/result for basic example.PNG" width="20%" height="20%">
</p>

Finally we had to implement a method that would take the number as a parameter corresponding to the number of Trues (v) allowed in the vector V. The lower the number the harder it is to find V hence the greater processing times. For example if we specified 2 Trues for the matrix M above then the unique solution would be the following since it contains 2 Trues (v).

<p align="center">
  <img src="img/unique solution.PNG" width="20%" height="20%">
</p>

Now that our program was working we had to test it with bigger and bigger matrixes and report on the processing times.  
Here is a preview of the method manipulating bigger matrixes whilst specifying the number of Trues (7 in this case). Roughly 12 seconds to find the result.  

<p align="center">
  <img src="img/7 v.PNG" width="100%" height="100%">
</p>

This project was completed in the second year of my Computer Science degree at the F.S.T Limoges (France) with Yoann Sochaj.

>## Technology used:
Prolog: https://www.swi-prolog.org/

>## Authors:
- Matt TAYLOR
- Yoann SOCHAJ [(GitHub profile)](https://github.com/YoannSo)

>## Useful Links:
>#### Project report: [TAYLOR_SOCHAJ.pdf](TAYLOR_SOCHAJ.pdf)
