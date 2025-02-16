# immunopipe-GateD-2021


Reanalysis of the scRNA-seq and scTCR-seq data from [Gate, David, et al., 2021](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9122025/) using [immunopipe](https://github.com/pwwang/immunopipe).

> [Gate, David, et al. "CD4+ T cells contribute to neurodegeneration in Lewy body dementia." Science 374.6569 (2021): 868-874.](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9122025/)
>

## Data preparation

The data was downloaded from [GSE161192](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE161192), where 4 samples from 2 patients were sequenced with scRNA-seq and scTCR-seq.

See `prepare-data.sh` for details.

## Configuration

> [!Note]
> This is not a replication of the original paper.
>

We used a minimal configuration for the analysis, which includes very basic steps such as cell filtering, clustering, and differential expression analysis. The configuration can be found in `Immunopipe.config.toml`.

The paper also focused on all of the cells, rathen than T cells. To do that, on could propose a configuration file without T cell selection, and remove `TCRData` from the input file.

## Results/Reports

You can find the results in the `Immunopipe-output` directory.

The report can be found at [https://imp-gated-2021.pwwang.com/REPORTS](https://imp-gated-2021.pwwang.com/REPORTS).
