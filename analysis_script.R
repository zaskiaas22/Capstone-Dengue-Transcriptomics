# ---------------------------------------------------------
# CAPSTONE PROJECT: TRANSCRIPTOMICS ANALYSIS (GSE18090)
# ---------------------------------------------------------

# 1. Load Library yang dibutuhkan
library(ggplot2)
library(pheatmap)
library(clusterProfiler)
library(org.Hs.eg.db)

# 2. Persiapan Data (Pastikan variabel tT sudah ada dari GEO2R)
# Jika belum, pastikan file dataset sudah di-load ke RStudio
top50_genes <- tT[1:50, ]

# ---------------------------------------------------------
# 3. VISUALISASI 1: VOLCANO PLOT
# ---------------------------------------------------------
ggplot(tT, aes(x = logFC, y = -log10(adj.P.Val), color = diffexpressed)) +
  geom_point(alpha = 0.4, size = 1.5) +
  theme_minimal() +
  scale_color_manual(values = c("DOWN" = "blue", "NO" = "black", "UP" = "red")) +
  labs(title = "Volcano Plot GSE18090", x = "Log2 Fold Change", y = "-log10 Adjusted P-Value")

# ---------------------------------------------------------
# 4. VISUALISASI 2: HEATMAP (50 Gen Teratas)
# ---------------------------------------------------------
# Menggunakan kolom logFC karena data GSM mentah tidak tersedia di TopTable
exp_matrix <- as.matrix(top50_genes[, "logFC", drop=FALSE])
rownames(exp_matrix) <- rownames(top50_genes)

pheatmap(exp_matrix, 
         show_colnames = T, 
         show_rownames = T, 
         cluster_cols = F, 
         color = colorRampPalette(c("blue", "white", "red"))(100),
         main = "Heatmap Log2 Fold Change - GSE18090")

# ---------------------------------------------------------
# 5. ANALISIS ENRICHMENT (GO & KEGG)
# ---------------------------------------------------------

# Konversi Symbol ke Entrez ID untuk KEGG
ids <- bitr(tT$Gene.symbol, fromType = "SYMBOL", toType = "ENTREZID", OrgDb = org.Hs.eg.db)

# A. Gene Ontology (GO)
go_res <- enrichGO(gene         = ids$SYMBOL,
                   OrgDb        = org.Hs.eg.db,
                   keyType      = 'SYMBOL',
                   ont          = "BP",
                   pAdjustMethod = "BH",
                   pvalueCutoff  = 0.05)

dotplot(go_res, showCategory=10, title="Gene Ontology Analysis")

# B. KEGG Pathway
kegg_res <- enrichKEGG(gene         = ids$ENTREZID,
                       organism     = 'hsa',
                       pvalueCutoff = 1)

dotplot(kegg_res, showCategory=10, title="KEGG Pathway Analysis")
