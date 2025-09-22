# Make sure the data directory exists
if (!dir.exists("data")) dir.create("data")

# Correct URL & filename
download.file(
  "https://raw.githubusercontent.com/zdk123/SpiecEasi/master/data/amgut2.filt.phy.rda",
  destfile = "data/amgut2.filt.phy.rda",
  mode = "wb"    # in case it’s binary
)

# Load it
load("data/amgut2.filt.phy.rda")

otu_table(amgut2.filt.phy)
tax_table(amgut2.filt.phy)
data.frame(sample_data(amgut2.filt.phy)) -> sam

write.csv(data.frame(otu_table(amgut2.filt.phy)), "data/otu.amgut.csv")
write.csv(sam, "data/sample.amgut.csv")
write.csv(data.frame(tax_table(amgut2.filt.phy)), "data/tax.amgut.csv")
