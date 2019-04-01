  new Vue({
    el: '#app',
    data:{
        info: null,
        errored:false
    },
    mounted:function(){
     var self = this
      axios
        .get('http://sportsp.wp.xdomain.jp/wp-content/data.json')
        .then(function(response){self.info = response.data})
        .catch(function(error) {console.log(error);self.errored = true})
    }
  })
  if(navigator.onLine === false){
    alert("インターネットに接続されていないためデータを読み込めません。インターネットへ接続してください。")
  }
