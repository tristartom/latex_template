Basic template for writing latex 
===

1. Install latex
---

##### On Mac OSX

Install MacTex: downdload the 2.5G installation package [[link](http://mirror.ctan.org/systems/mac/mactex/MacTeX.pkg)], and install it.

##### On Ubuntu

```bash
sudo add-apt-repository ppa:texlive-backports/ppa
sudo apt-get update
sudo apt-get install texlive
```

(This might take long time.)


2. Write your content in ``mainbody.tex``
---

Here is a good tutorial for writing latex [[link](http://www.maths.tcd.ie/~dwilkins/LaTeXPrimer/)].


3. Compile latex (to pdf)
---

```bash
./tt_sh/latex.sh latex.
#Or 
./tt_sh/latex.sh latex
```

4. FAQ
---

Problem: ``ps2pdf`` does not work in ``latex.sh``

Fix: `` sudo ln -s /opt/X11 /usr/X11``

