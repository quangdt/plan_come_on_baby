:: Create a log diretory to store the result of this run
:: set hour=%time: =0%
set logdir= D:\project_auto\reports/%date:~-4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%
mkdir %logdir%
:: run the automation script
call python -m robot.run --outputdir %logdir% --suite * D:\project_auto\suites
call exit()
