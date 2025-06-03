# Deletes the file(s) or directories 
output_file_name = '~/Downloads/Lab10_eQTL'
unlink(output_file_name)

unlink("~/Downloads/Lab7_scRNAseq/lab7_cache", recursive = T)
# When deleting a directory (folder), "recursively" means removing:
# The directory itself
# All files inside it
# All subdirectories and their contents
