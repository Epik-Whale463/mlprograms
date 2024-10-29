# Print numbers from 1 to 10
1:10

# Basic mathematical operations
sum(1:10)           # Sum of numbers 1 to 10
mean(c(4, 8, 15))   # Calculate the mean
sd(c(4, 8, 15))     # Calculate the standard deviation

# Generate a sequence of numbers
seq(1, 10, by = 2)  # Creates a sequence from 1 to 10 with a step of 2


# Load the iris dataset and plot Sepal.Length vs. Sepal.Width
data(iris)
plot(iris$Sepal.Length, iris$Sepal.Width, main = "Sepal Length vs Width",
     xlab = "Sepal Length", ylab = "Sepal Width", col = iris$Species)


# Plot a histogram of Sepal.Length
hist(iris$Sepal.Length, main = "Histogram of Sepal Length", xlab = "Sepal Length", col = "lightblue")



# Load the mtcars dataset
data(mtcars)

# Select specific columns and rows
mtcars[1:5, ]         # First 5 rows of mtcars
mtcars[, "mpg"]       # All rows of the 'mpg' column
mtcars[mtcars$mpg > 20, ]  # Rows where mpg is greater than 20


# Loading a CSV file (replace 'file_path' with the path to your CSV file)
data <- read.csv("file_path.csv")
head(data)  # Display the first few rows



# Loading and viewing the first rows of the iris dataset
data(iris)
head(iris)



# Summary statistics for the iris dataset
summary(iris)


# Boxplot for visualizing distribution by species
boxplot(Sepal.Length ~ Species, data = iris, main = "Sepal Length by Species",
        xlab = "Species", ylab = "Sepal Length", col = c("orange", "green", "blue"))


# Correlation matrix for the mtcars dataset
cor(mtcars[, sapply(mtcars, is.numeric)]) # Only numeric columns

