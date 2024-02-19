def progress_bar
  bar = TTY::ProgressBar.new("Progresso [:bar]", total: 30)
  30.times { sleep(0.1); bar.advance }
  end
