#' ---
#' title: "Data Science Methods, Lab for Week 2: Git"
#' author: "Dan Hicks"
#' email: hicks.daniel.j@gmail.com
#' output:
#'   html_document:
#'     toc: true
#' ---

#+ setup, echo=FALSE
## NB You probably don't want to edit anything here
library(knitr)
opts_chunk$set(out.width='40%', echo=FALSE, fig.align='center')


#' This lab introduces you to navigating histories on GitHub, `git checkout`, and `git branch`, as well as the git side of the workflow we'll use for labs.  
#' 
#' *Summary*: 
#' 1. Use `git checkout [hash]` to go back to a previous commit. 
#' 2. Use `git checkout [branch]` to move to the latest commit for a branch. 
#' 3. The git side of the lab workflow goes like this: 
#'   a. Fork and clone the lab repo from <https://github.com/data-science-methods>. 
#'   b. Follow the instructions in `lab.R`
#'   c. When you're finished, push the results back up to GitHub and file a pull request against the original repo. 
#'   


#' # Problem 1 #
#' Navigate to the GitHub repo for this lab assignment, <https://github.com/data-science-methods/lab-w2-git>.  Fork the lab, then clone it to your working machine.  Open the file `lab.R` in a *new* R session.  
#' 


#' # Problem 2 #
#' Edit `lab.R`.  You don't need to do anything in particular, but they should be trackable changes by it.  Add and commit the changes to your working machine.  
#' 


#' # Problem 3 #
#' Edit `lab.R` again.  Add and commit the changes to your working machine, *and then* push them to your GitHub fork.  
#' 


#' # Problem 4 #
#' 1. Open your fork of the lab repo on GitHub.  The URL will be something like <https://github.com/username/lab-w2-git>.  
#' 2. Find and click on the history button, above the file list and to the right. (I wasn't able to find a keyboard shortcut for this. :-( )

#+ fig.cap="The history button in GitHub is immediately above the file list, on the right"
include_graphics(file.path('img', 'history.png'))

#' 3. Look through the history for your commit from problem 2.  Click on the *comment* to view the *diff*, or the changes made by that commit.  
#' 4. Back on the history page, find the *hash* on the right side.  It should be a series of 7 letters and numbers.  This is an ID code that git uses to track each individual commit.  Click on the clipboard icon to copy the hash. 

#+ fig.cap="The hash for a commit is the series of 7 letters on the right side of the entry in the history view."
include_graphics(file.path('img', 'hash.png'))

#'


#' # Problem 5 #
#' 1. Back on your working machine, enter the following into the command line, pasting your hash in place of the example. 
#' 
#' ```
#' $ git checkout 5fc4a1cbe6331e1a38a70ed49d7bfc8182461bc2
#' ```
#' 
#' 2. Look at `lab.R`. Your edits from Problem 3 are gone! 
#' 3. Check `git status`. Note that it says `HEAD detached at [hash]` in red.  This means that making commits right now will cause serious problems. 
#' 4. To make commits (including permanently undoing a commit), we need to learn about *branches*.  That's next! For now, entering the following: 
#'
#' ```
#' $ git checkout main
#' ```
#' 


#' # Problem 6 #
#' A *branch* is a sequence of commits, running from past to future.  Git allows you to have multiple branches, working in parallel, that can then be recombined.  The idea is that, in a complex project, different programmers will be working on different components of the project, which can then be combined into the primary branch of the project (usually called "main" or "master") for release.  
#' 

#+ fig.cap='Diagram of branches and merging in git.  Source: <https://english.stackexchange.com/questions/474419/does-the-term-master-in-git-the-vc-system-refer-to-slavery>, which has a worthwhile discussion of the valence of the term "master" in git.'
include_graphics(file.path('img', 'branch.png'))

#' 1. To create a *new* branch called `bobcat`, you simply use `checkout` with `-b` and the branch name: 
#' ```
#' $ git checkout -b bobcat
#' ```
#' 
#' 2. Use `git status` to confirm that you're on the `bobcat` branch.  
#' 3. Make some changes and commit them.  
#' 4. Once a branch exists, you still use `checkout` but without the `-b`: 
#' 
#' ```
#' $ git checkout main
#' ```
#' 
#' Confirm that the changes from step 3 have been reversed. Note that we did this up above to get back from the "detached HEAD" state.  
#' 5. Checkout `bobcat` again and confirm that your changes are back.  
#' 


#' # Problem 7 #
#' To combine branches we use the command `merge`.  
#' 1. Ensure that you're on the `main` branch.  Then enter the following: 
#' ```
#' git merge bobcat
#' ```
#' 2. *If there aren't any conflicts*, you'll be prompted to edit the default commit message and everything will work smoothly. 
#' 3. *If there are conflicts*, things are more complicated.  Git will tell you what files have conflicts, and `git status` will indicate that you're in the middle of a merge. 
#'   a. The conflicting content from each fill be shown together, surrounded by `<<<<<<<` and `>>>>>>>`.  
#'   b. Open the file(s), search for `<<<<<<<`.  Edit to resolve the conflict.  Remove the conflict indicators added by git.  
#'   c. To finish the merge, add the fixed files and use `git commit` again. 
#'   d. For more, see here: <https://githowto.com/resolving_conflicts>
#'   




