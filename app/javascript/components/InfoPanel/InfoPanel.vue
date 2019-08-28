<template>
    <div class="info-panel">
      
      <h2>{{message}}</h2>
      <p>Dados do veículo: </p>
      <ul>
        <li>{{carInfo.name}}</li>
        <li>{{carInfo.price}}</li>
        <li>{{carInfo.year}}</li>
        <li><a :href="carInfo.link">Link para o carro</a></li>
      </ul>

      <p>Dados da pessoa: </p>
      <ul>
        <li>{{personalInfo.name}}</li>
        <li>{{personalInfo.email}}</li>
        <li>{{personalInfo.phone}}</li>
      </ul>
    </div>
</template>
<script>
export default {
  name: 'InfoPanel',

  props: {
    message: {
      type: String,
      default: null
    },
    carInfo: {
      type: Object,
      default: null
    },
    personalInfo: {
      type: Object,
      default: null
    }
  },

  data() {
    return {
      
    }
  },

  mounted() {
    console.log(this.message)
  }
}
</script>

<style>
.info-panel {
  margin-left: 20px;
}
</style>