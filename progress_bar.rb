def progress_bar
  bar = TTY::ProgressBar.new("Traduzindo [:bar] :percent", total: 20)
  20.times { sleep(0.1); bar.advance }
  end
