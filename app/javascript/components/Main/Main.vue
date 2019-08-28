<template>
  <div>
    <div class="upload-wrapper">
      <upload-wrapper></upload-wrapper>
    </div>
  </div>
</template>

<script>
import UploadWrapper from '../UploadWrapper';
import InfoPanel from '../InfoPanel';

export default {
  name: 'Main',

  components: {
    UploadWrapper, InfoPanel,
  },

  data() {
    return {
      name: '',
      setup: false,
      faucetsNumber: 0,
      faucetsNot: 0,
    }
  },

  props: {
    componentName: {
      type: String,
      required: true,
    },
    componentData: {
      type: Array,
    },
  },

  created() {
    
  },

  computed: {
    loadComponent() {
      return componentDicionary[this.componentName]
    }
  }
}
</script>

<style>
.upload-wrapper {
  height: 200px;
  width: 100%;
  margin: auto;
} 

.info-panel-wrapper {
  width: 100%;
  border: 2px solid brown;
  margin-top: 20px;
}

</style>
