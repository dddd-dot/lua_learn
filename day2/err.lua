-- error 函数
function testError()
  error("This is an error")
end

-- assert(v[, message]) 首先检查 第一个参数，如果不发生错误，直接返回，如果发生错误，将第二个参数的错误，返回
function testAssert()
  local n = io.read()
  assert(tonumber(n), "You input a not number : " .. n)
end

--pcall(...) 捕捉函数的异常
function testPcall()
  if pcall(testError) then
    print("ok")
  else
    print("error")
  end
end

function testPcall2()
  -- 这样子可以捕捉到异常
  local status, err =
    pcall(
    function()
      error({code = 100})
    end
  )
  print(status, err, err.code)
  print("----------------------------")
  status, err =
    pcall(
    function()
      return 2
    end
  )
  print(status, err)
end
testPcall2()
