weight_g <- c(50, 60, 65, 82) ###c introduce un vettore

animals <- c("mouse" , "rat" , "dog") ###se non metto le virgolette rinosce mouse come oggetto, quindi come contenitore di qualcosa 

### Get the lenght of the vector
length (animals)

### Get the type of data contained in the vector
class(animals)
class(weight_g)

### Structure of the object 
str(animals)

### How to add and element to the beginning of a vector 
animals <- c("cincilla", animals)
animals <- c(animals, "frog")

typeof(animals)

### Exercise ### 
num_char <- c(1,2,3, "a")
num_logical <- c(1,2,3, TRUE)
char_logical <- c("a" , "b" , "c", TRUE)
tricky <- c(1,2,3, "4")
# logical <- numeric <- character
# logical <- character

# subsetting a vector
animals[2]
animals [c(1,2)] 

more_animals <- animals[c(1,2,3,2,1,4)] 

weight_g
weight_g [c(FALSE, FALSE, TRUE, TRUE)] 
weight_g > 63
weight_g [weight_g > 63] 
weight_g [weight_g > 63 & weight_g < 80] 
weight_g [weight_g < 58 | weight_g > 80] 
weight_g==65
# <, >, ==, !=: different , <=, >= , !oppposto simboli che posso usare

animals[animals == "rat" | animals =="frog"]
# animals [ animals== "rat"| aninals =="frog" | animals ... ]
# %in% help uso find all elements corresponding to a vectore of elements of our choice
animals %in% c ("rat", "frog", "cat", "duck", "dog")
animals [animals %in% c ("rat", "frog", "cat", "duck", "dog")]

# An example of a vector with missing date NA scrvi in stampatello maiuscolo 
heights <- c(2,4,4,NA,6)
mean (heights)
mean (heights, na.rm = T)
max (heights, na.rm = T)
# 'NA' 
# NA
# TRUE
# identify which are the missing data (a.k.a NA)
is.na(heights)
heights [!is.na(heights)]
na.omit(heights)
# extract the complete cases 
heights [complete.cases(heights)]

### challenge

heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63,6)
heights_no_na <- heights [!is.na(heights)]


median(heights, na.rm = TRUE)

heights > 67

heights_no_na [heights_no_na > 67] 
length (heights_no_na[heights_no_na > 67])
