# Server calculator on Haskell

Сервер, написанный на языке Haskell, имитирует базовые функции калькулятора:
- умножение            (/mul/x/y)
- деление              (/div/x/y)
- сложение             (/add/x/y)
- разнциа              (/sub/x/y)
- взятие корня         (/sqrt/x)
- возведение в степень (/pow/x/n)

# Инструкция к запуску
```bash
git clone git@github.com:arteeemik/haskel-server-calculator.git
cd haskel-server-calculator
stack setup
stack build
stack run
```

Сервер запуститься на локальном порту ```8000```

# Примеры запросов к серверу
- ##**Сложение**:
```bash
curl  'http://localhost:8000/add/10.101/1'

{"operator":"add","error":null,"arguments":[10.101,1],"result":11.101}
```

- ##**Разница**:
```bash
curl  'http://localhost:8000/sub/10.101/1'

{"operator":"sub","error":null,"arguments":[10.101,1],"result":9.101}
```

- ##**Умножение**:
```bash
curl  'http://localhost:8000/mul/10.101/1'

{"operator":"mull","error":null,"arguments":[10.101,1],"result":10.101}
```

```bash
curl  'http://localhost:8000/mul/10.101/10'

{"operator":"mull","error":null,"arguments":[10.101,10],"result":101.01}
```

- ##**Деление**:
```bash
curl  'http://localhost:8000/div/10.101/10'

{"operator":"div","error":null,"arguments":[10.101,10],"result":1.0101}

curl  'http://localhost:8000/div/-5/0'

{"operator":"div","error":"Division by zero","arguments":[-5,0],"result":null}
```

- ##**Взятие корня**:
```bash
curl  'http://localhost:8000/sqrt/10.101'

{"operator":"sqrt","error":null,"arguments":[10.101],"result":3.1782070417139283}

curl  'http://localhost:8000/sqrt/-5'

{"operator":"sqrt","error":"Taking the root of a negative number","arguments":[-5],"result":null}
```

- ##**Возведение в степень**:
```bash
curl  'http://localhost:8000/pow/10.101/3'

{"operator":"pow","error":null,"arguments":[10.101,3],"result":1030.6070603010003}

curl  'http://localhost:8000/pow/0/3'

{"operator":"pow","error":null,"arguments":[0,3],"result":0}

curl  'http://localhost:8000/pow/0/-1'

{"operator":"pow","error":"Raising to the negative power of zero","arguments":[0,-1],"result":null}
```
