# Capstone Project: Analisis Transkriptomik Respon Inang pada Infeksi Virus Dengue (GSE18090)

## Deskripsi Proyek
Proyek ini bertujuan untuk mengidentifikasi tanda genetik (gene signature) dan jalur biologis yang teraktivasi pada pasien Dengue fase akut menggunakan dataset publik GSE18090.

## Problem Statement
Dengue merupakan masalah kesehatan global yang kompleks. Proyek ini mencari tahu bagaimana sel inang merespons stres akibat replikasi virus pada tingkat molekuler.

## Metode
- **Data Source**: NCBI GEO GSE18090.
- **Tools**: R (Library: limma, pheatmap, clusterProfiler, ggplot2).
- **Kriteria**: Adjusted P-value < 0.05.

## Hasil Utama
1. **Volcano Plot**: Identifikasi gen yang naik (upregulated) dan turun (downregulated).
2. **Heatmap**: Pola ekspresi 50 gen teratas yang paling signifikan.
3. **Enrichment**: Ditemukan aktivitas pada jalur *Response to Endoplasmic Reticulum Stress* dan *B Cell Receptor Signaling*.

## Kesimpulan
Infeksi Dengue memicu stres seluler yang masif dan aktivasi sistem imun adaptif (Sel B) untuk memproduksi antibodi.
