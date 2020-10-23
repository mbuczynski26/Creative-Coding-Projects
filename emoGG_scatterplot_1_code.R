# load libraries 

library(ggplot2)
library(emoGG)

### Make data and plot

# choose is the starting point used in the generation of a sequence of random numbers with set.seed()

set.seed(299)

# Make some noisily increasing data

df2 <- data.frame(cond = rep(c("A", "B", "C"), each=10),
                  xval = 1:30 + rnorm(20,sd=3),
                  yval = 1:30 + rnorm(20,sd=6))

# rename row values "A", "B", "C" as "Ghost," "Pumpkin", and "Candy"

df2$cond[df2$cond == "A"] <- "Ghost"
df2$cond[df2$cond == "B"] <- "Pumpkin"
df2$cond[df2$cond == "C"] <- "Candy"

# Plot layer 1: 

g1 <- ggplot(df2, aes(x =xval, y = yval)) +    # map x and y values  
  geom_emoji(data = df2[df2$cond == "Ghost", ], emoji = "1f47b") +   # map emojis to data points based on groups  
  geom_emoji(data = df2[df2$cond == "Pumpkin", ], emoji = "1f383") +
  geom_emoji(data = df2[df2$cond == "Candy", ], emoji = "1f36c") +
  labs(
    subtitle = "Ft. Ghost, Pumpkin, & Candy Emojis") +                  # add subtitle 
  ggtitle("Happy Halloween!") +                                 # add title 
  theme_bw()                                                # change theme to black and white from 

# Plot layer 2: 

g2 <- g1 + 
  theme(
    plot.title = element_text(color="darkorange1"),     # change color of plot title 
    axis.title.x = element_text(color="darkorange1"),  # change color of x axis 
    axis.title.y = element_text(color="darkorange1"))  # change color of y axis 

# Plot layer 3:

g2 + geom_smooth(                 # add "smooth" trending line 
  aes(color = cond),                    # lines are grouped by "cond" i.e. by the type of emoji    
  show.legend = FALSE,             # do not show legend for trend lines
  se = FALSE) +                 # do not show CI's 
  scale_color_manual(
    values = c("#CC0066", "#666666", "#E7B800")) # add colors to lines

### Make Legend Table 

# Note: to generate table, the below code must be in RMarkdown file (not in code chunk) and comments denoted by "#" need to be removed 


\begin{table}[ht]         

# location of table with respect to page 
\centering        

# indicate the lines of the columns with "|" and the position of the data contents with "c" 
\begin{tabular}{|c | c| c|} 

# horizontal line
\hline  

# header
Candy & Pumpkin & Ghost \\

\hline 

#table contents
\includegraphics[width=1in, height=1.5in]{candy} & \includegraphics[width=1in, height=1.5in]{pumpkin} & \includegraphics[width=1in, height=2in]{ghost} \\ 

\hline 

\end{tabular}

# caption
\caption{Emoji Type Legend. Note: See Table 1 for corresponding scatterplot.}  

# set label for cross referencing 
\label{legend_emo1}  

\end{table}

