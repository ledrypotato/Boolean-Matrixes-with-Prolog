<h1 align="center"> Boolean Matrixes </h1>
<br>

>## Project:
The goal of this project was to manipulate boolean matrixes.  

Let's go over a basic example: **V** x **M**

<p align="center">
  <img src="basic example.PNG" width="20%" height="20%">
</p>

Consider matrixes with **n** lines and **k** columns containing boolean values: v (vrai = true in French) and f (faux = false in French).  

1. Initialise a line vector R (Result) of length **k** containing only Falses (f).  
2. Iterate over the elements in V (most left matrix):
- if the element is False (f) then do nothing 
- if the element i is True (v) then add the line i of the second matrix M(middle one) to R  

3. After iterating over all the elements of V the vector R contains all of the lines of M that are at positions corresponding to the lines that contain True (v) in the vector V

Proceed to XOR the columns of R.

This project was completed in the second year of my Computer Science degree at the F.S.T Limoges (France) with Yoann Sochaj.

>## Technology used:
Prolog: https://www.swi-prolog.org/

>## Authors:
- Matt TAYLOR
- Yoann SOCHAJ [(GitHub profile)](https://github.com/YoannSo)

>## Useful Links:
>#### Project report: [TAYLOR_SOCHAJ.pdf](TAYLOR_SOCHAJ.pdf)
