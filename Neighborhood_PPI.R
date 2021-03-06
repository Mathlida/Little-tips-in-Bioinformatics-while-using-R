library(iRefR)
hint=read.table(file="hint.txt") 
##three cols
nrows=nrow(hint)
graph_hint_pre=cbind(hint,data.frame(rep("X",nrows)),data.frame(1,nrows))
#graph_hint_pre need 5 lines, so two lines should added to hint
graph_hint=convert_edgeList_to_graph(graph_hint)
disgene=read.table(file="disgene.txt")
nrows=nrow(disgene)
disgene=as.character(unlist(disgene))
order=1
gene_seed=neighborhood(graph_hint,order,disgene)
#order one the adjacent nodes, order two the adjacent to the adjacents, and so on.
allgene=vector()#use allgene to save all the disease genes and their neighbors
for(i in 1:nrows){
	allgene=c(allgene,gene_seed[[i]])
}
write.table(allgene,file="gene_seed.txt",quote = F,row.names = F,col.names = F)
