library("igraph")

links <- read.csv(file = choose.files(), header = T, sep = ';')

links<-links[links$Nofollow.Dofollow=='Dofollow',]

links <- links[,c("Source", "Destination")]
g <- graph.data.frame(links)
pr <- page.rank(g, algo = "prpack", vids = V(g), directed = TRUE, damping = 0.85)

int_pr <- page.rank(g, algo = "prpack", vids = V(g))

int_pr<- as.data.frame(int_pr$vector)
int_pr<- cbind(rownames(int_pr), int_pr)
row.names(int_pr) <- NULL
names(int_pr)[1] <- "URL"
names(int_pr)[2] <- "Internal PR"

write.csv(int_pr, file = choose.files()) # Output file.
