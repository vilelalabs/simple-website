<template>
  <div class="page">
    <h1>Teste para Pipeline Jenkins</h1>
    <p>Pagina de Teste para implementação de web-site rodando a partir da núvem da AWS.</p>
    <p>O teste completo implementará algumas ferramentas:</p>
    <ButtonList />
  </div>
</template>

<script>

import ButtonList from './ButtonList.vue'

export default {
  name: 'MainPage',
  components: {
    ButtonList
  }
}


</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
body {
  margin: 0;
  padding: 0;
  box-sizing: border-box
}

.page {
  display: flex;
  flex-direction: column;
  background: #2c3e50;
  color: #fff;
  height: 100vh;
}
</style>
