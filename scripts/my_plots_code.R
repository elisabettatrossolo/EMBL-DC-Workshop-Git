# fare grafici con ggplot2
library(ggplot2)
# 1. define gglor object
# plt <- ggplot(data = <data.frame>, mapping = > aestethics>)
# x aestetics y aestetics color aestetics shape aestetics--- 
# 2. add geometry layer(s) geom: pointi line bar.. violin,,, 


plt <- ggplot(data = surveys_complete,
       mapping = aes(x = weight, y = hindfoot_length))
plt
str(plt)

plt + 
  geom_point()

plt + 
  geom_point() + 
  ggtitle("My first plot")

plt <- ggplot(data= surveys_complete, mapping = aes(x= weight, y =hindfoot_length)) + geom_point()

plt + 
  ggtitle("Weight vs hindfoot length")

install.packages("hexbin")
library(hexbin) # ti da una nuova geometria
ggplot (data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length))+
 geom_hex() 


### Di nuovo 

ggplot(data= surveys_complete, mapping = aes(x= weight, y =hindfoot_length)) + 
  geom_point(alpha=0.1) # alpha transparency

ggplot(data= surveys_complete, mapping = aes(x= weight, y =hindfoot_length)) + 
  geom_point(alpha=0.1, color = "blue")  ### aggiungiamo i colori 

ggplot(data= surveys_complete, mapping = aes(x= weight, y =hindfoot_length)) + 
  geom_point(alpha=0.25, aes(color = species_id))  ### aggiungiamo piu colori per variabili

ggplot(
  data= surveys_complete,
  mapping = aes(
    x = weight,
    y = hindfoot_length,
    color = species_id
  )
) + geom_point(alpha = 0.25) ### another way hot write it 


### Challeng: scatterplot of weight vs species_id color by plote_type

ggplot(data= surveys_complete, mapping = aes (x= species_id, y= weight)) + 
  geom_point(aes(color = plot_type)) ### ma il grafico e' un po sovrapposto quindi devo cambiare grafico

ggplot(data= surveys_complete, 
       mapping = aes(
         x= species_id, y= weight)
       ) +
  geom_boxplot() #### box plot quindi ! ma ci sono dei limiti,  quindi altro grafico 

ggplot(data= surveys_complete, 
       mapping = aes(
         x= species_id, 
         y= weight)
) +
  geom_boxplot(outlier.shape = NA) + 
  geom_jitter(alpha = 0.3, color = "salmon") ### adding a little value for each x coord

### metter box plot davanti 
ggplot(
  data= surveys_complete, 
  mapping = aes(
  x = species_id, 
  y = weight)
) +
  geom_jitter(alpha = 0.3, color = "salmon") +
  geom_boxplot(outlier.shape = NA, fill = NA)

#### challenge: produce a violin plto of weight by species_id 

ggplot(
  data = surveys_complete,
  mapping = aes(
    x = species_id,
    y = weight)
    ) +
    geom_violin() +
  scale_y_log10() +
  ylab ("Weight (log10)")

### fai un boxplot + jittered scatterplot of hingfoot_lenght by species_id. 
#boxplto in front of the dots and filled with white

ggplot(
  data = surveys_complete,
       mapping = aes(
         x = species_id,
         y = hindfoot_length)
       ) +
         geom_jitter(aes(color = plot_id)) +
         geom_boxplot(outlier.shape = NA)

yearly_count <- surveys_complete %>% 
  count(year, genus)

ggplot(
  data = yearly_count, 
  mapping = aes(
    x = year,
    y = n,
    color = genus)) +
  geom_line() +
  theme(panel.grid = element_blank())

yearly_count %>%
  ggplot(mapping = aes(x = year, y = n, color = genus)) +
  geom_line()

yearly_count_graph <- surveys_complete %>%
  count(year, genus) %>%
  ggplot(mapping = aes( x = year, y = n,  color = genus ))+
  geom_line()
yearly_count_graph ### to messy something a graphs like this quindi si puo separare
## un grafico per genus

###faceting!!!
 
ggplot(
  data = yearly_count, 
  mapping = aes(
    x = year, y = n)) + 
  geom_line() + 
  facet_wrap(facets = vars(genus))

surveys_complete %>%
  count(year, genus, sex) %>%
  ggplot(
    mapping = aes(
      x = year, 
      y = n,
      color = sex)) +
  geom_line() +
  facet_grid(
    cols = vars(genus) # cols fa in colonne 
  )


plt <- surveys_complete %>%
  count(year, genus, sex) %>%
  ggplot(
    mapping = aes(
      x = year, 
      y = n,
      color = sex)) +
  geom_line() +
  facet_wrap(facets = vars(genus)) + 
  xlab("Year of observation") +
  ylab("Number of individuals") +
  ggtitle("Observed genera over time") +
  theme_bw(base_size = 14) +
  theme(
    legend.position = "bottom",
      aspect.ratio = 1,
    axis.text.x = element_text(
      angle = 45,
      hjust = 1
    ),
    plot.title = element_text(hjust = 0.5),
    panel.grid = element_blank()
  )


ggsave(filename = "data/plot.pdf", plot = plt,
       width = 10, 
       height = 10)




