
const a = () => {
  const list = []
  //let 01 var 22
  for (let i = 0; i < 2; i++) {
    list.push(() => console.log(i))
  }
  list.forEach((i) => {
    i()
  })
}
a()