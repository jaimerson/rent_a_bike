require 'benchmark'

desc 'Run all benchmarks'
task benchmarks: [:environment] do
  BikesReport.refresh
  Benchmark.bm do |b|
    b.report(:naive) { BikesReport::NaiveApproach.new.to_a }
    b.report(:ar_and_sql) { BikesReport::ActiveRecordSqlApproach.new.to_a }
    b.report(:view) { BikesReport::ViewApproach.new.to_a }
  end
end
