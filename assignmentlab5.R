
# Loading in data ---------------------------------------------------------

library(tidyverse)
iris
iris <- as_tibble(iris)


# Questions ---------------------------------------------------------------

## Question 1
rename(iris, 
sepal_length = Sepal.Length,
sepal_width= Sepal.Width,
petal_width=Petal.Width,
petal_length = Petal.Length)
iris2 <- rename(iris, 
             sepal_length = Sepal.Length,
             sepal_width= Sepal.Width,
             petal_width=Petal.Width,
             petal_length = Petal.Length)
iris2
## Question 2
mutate(iris2,
       sepal_length=sepal_length*10,
       sepal_width=sepal_width*10,
       petal_width=petal_width*10,
       petal_length=petal_length*10)

##Question 3
mutate(iris2,
       sepal_area = sepal_length * sepal_width, 
       petal_area = petal_length * petal_width)

## Question 4
summarize(iris2, sampl_size= n(),)
summarize(iris2, max_sepal_length = max(sepal_length))
summarize(iris2, min_sepal_length = min(sepal_length))
summarize(iris2, range_sepal_length = range(sepal_length))
summarize(iris2, med_sepal_length = median(sepal_length))
summarize(iris2, q1 = quantile(sepal_length, probs=0.25))
summarize(iris2, q3=quantile(sepal_length, probs=0.75))
summarize(iris2, IQR_sepal_length = IQR(sepal_length))

## Question 5
petal_grouped<- group_by(iris2,Species)
petal_grouped
petal_widthsummary <-
        summarize(
                petal_grouped,
                sampl_size = n(),
                mean_petal_width = mean(petal_width),
                sd_petal_width = sd(petal_width),
                var_petal_width = var(petal_width),
                sem_petal_width = sd_petal_width / sqrt(sampl_size),
                ci_upper_limit = mean_petal_width + 1.96 *
                        sem_petal_width,
                ci_lower_limit = mean_petal_width - 1.96 * sem_petal_width
        )
petal_widthsummary
## Question 6
ggplot(data = iris2) +
        geom_jitter(mapping = aes(x = Species, y = petal_width))



## Question 7
ggplot(data = iris2)+
        geom_jitter(mapping=aes(x=Species,y=petal_width))+
        geom_crossbar(
                data=petal_widthsummary,
                mapping=aes(x=Species,y=mean_petal_width, ymax = ci_upper_limit,
                            ymin = ci_lower_limit))
## Question 8
ggplot(data = iris2)+
        geom_point(mapping=aes(x=petal_length,y=petal_width,color=Species,shape=Species))
        


