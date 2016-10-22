#################
# Luz Frias
# 2016-10-12
# reto
# basado en: https://cran.r-project.org/doc/manuals/R-intro.pdf
#################

# Ejercicio 1: dado x construido de la siguiente manera
w <- c(2, 7, 8)
v <- c("A", "B", "C")
x <- list(w, v)
# escribe una nueva sentencia que reemplace "A" por "K" en la lista x
x[[2]][1] <- "K"

# Ejercicio 2: dado a
a <- list ("x"=5, "y"=10, "z"=15)
# calcula en una sentencia la suma de sus elementos
# pista: ?unlist
sum(unlist(a))

# Ejercicio 3: dado
b <- list(a=1:10, b=seq(3), c=rep(2, 5))
# escribe una sentencia que devuelva un vector con la longitud de cada uno de los elementos de lista
lapply(b, function(x) length(x))
sapply(b, length)

# Ejercicio 4
c <- list(a=1:10, c="Hello", d="AA")
# escribe una sentencia que devuelva todos los elementos de la lista menos el primero



# Ejercicio 5
d <- list(a=5:10, c="Hello", d="AA")
# escribe una sentencia que añada al final de d un elemento "ZZ"
c(d, e="ZZ")

# Ejercicio 6
e <- list("a", "b", "c")
# escribe una sentencia que asigne como nombres de elementos "one", "two" and "three" a e
names(e) <- c("one", "two", "three")

# Ejercicio 7
f <- list(1, 5, 7)
g <- list(2, 5, 8)
# escribe una sentencia que devuelva los valores de f que no están en g
# pista: ?`%in%`
f[!f %in% g]
# ¿Otra forma?
setdiff(f, g )

# Ejercicio 8
# A partir del dataset state.center ya cargado en R
# Comprueba el tipo de dato, examínalo y conviértelo a data.frame
#Tipos de Datos
sapply(state.center, class)
sapply(state.center, typeof)
#Examinar ¿?
str(state.center)
#Convertir a DataFrame
myDataFrame = data.frame(state.center)

# Ejercicio 9
# Crea un data.frame con 3 columnas a partir de 3 vectores numéricos a tu gusto
# Ordena las filas de manera descendente con los valores de la primera columna
# pista: ?order

v1 <- round(runif(800, 0.0, 1.0), digits=2)
v2 <- 1:800
v3 <- round(runif(800, 0.0, 1.0), digits=3)
df <- data.frame(v1,v2,v3)
df[order(-v1), ]

# Ejercicio 10
# A partir del data.frame
h <- as.data.frame(diag(4))
# Renombra los nombres de las filas para que se llamen i_row (es decir, 1_row, 2_row, ...)
# y las columnas a j_col (es decir, 1_col, 2_col, ...)
# pista: puedes utilizar rownames, colnames, nrow, ncol, paste0 y sapply
rownames(h) <- paste0(seq_len(nrow(h)), "_row")
colnames(h) <- paste0(seq_len(ncol(h)), "_col")
h

# Ejercicio 11
# A partir del dataset VADeaths ya cargado en R
# a) Comprueba si es un data.frame y si no, conviértelo
is.data.frame(VADeaths)
df <- as.data.frame(VADeaths)
is.data.frame(df)
# b) Crea una una columna Total con la suma de cada fila
df[,"Total" ]<- rowSums(df)
# c) Cambia de orden las columnas, de forma que Total sea la primera
df[,c(ncol(df),1:(ncol(df)-1))]

# Ejercicio 12
# A partir del dataset state.x77 ya cargado en R
# a) Comprueba si es un data.frame y si no, conviértelo
is.data.frame(state.x77)
x77.df <- as.data.frame(state.x77)
is.data.frame(x77.df)
# b) Extrae el número de estados con un ingreso menor a 4300
x77.df.income <- subset(x77.df, Income < 4300)
x77.df.income
# c) Extrae el estado con el ingreso más alto. Pista: ?which
x77.df[which(x77.df$Income == max(x77.df$Income)),]

# Ejercicio 13
# A partir del dataset swiss, crea un data.frame únicamente con las filas
# 1, 2, 3, 10, 11, 12 and 13, y solo con las columnas Examination, Education and Infant.Mortality
my.df <- swiss[c(1, 2, 3, 10, 11, 12, 13), c("Examination", "Education", "Infant.Mortality")]

# a) La mortalidad infantil de Sarine está mal, debería ser NA, cámbialo.
my.df["Sarine", "Infant.Mortality"] <- NA
my.df
# b) Crea una columna Total con la suma de cada fila. Si te encuentras NAs, ignóralos (suman 0)
my.df[,"Total" ]<- rowSums(my.df, TRUE)
my.df
# c) Crea una columna of con la proporción de Examination (Examination / Total)
my.df[,"Exam/Total"] <- my.df["Examination"]/my.df["Total"]
my.df
