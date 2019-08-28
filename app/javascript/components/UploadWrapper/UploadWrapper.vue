<template>
  <div>
    <h1>Upload de emails(eml files)</h1>
    <p><a href="https://bit.ly/2Jlvwa6">Link para download do modelo</a></p>

    <input type="file" id="file" ref="file" v-on:change="handleFileUpload()"/>
    <button v-on:click="submitFile()">Submit</button>

    <div class="info-panel-wrapper">
      <InfoPanel v-if="showPanel"
        :message="loadMessage"
        :carInfo="loadCarInfo"
        :personalInfo="loadPersonalInfo"
      />
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import InfoPanel from '../InfoPanel';

export default {
  name: 'UploadWrapper',
  components: {
    InfoPanel
  },

  data() {
    return {
      file: '',
      car: {},
      personalInfo: {},
      message: '',
      showPanel: false
    }
  },

  methods: {
    handleFileUpload() {
      this.file = this.$refs.file.files[0];
    },

    submitFile() {
      let formData = new FormData();
      let headers = { headers: {'Content-Type': 'multipart/form-data'} }

      formData.append('file', this.file);
       axios.post( '/upload', formData, headers)
          .then((response) => {
            this.message = response.data.message;
            this.car = response.data.car_info;
            this.personalInfo = response.data.personal_info;
            this.showPanel = true;
          })
          .catch((response) => {
            console.log('FAILURE!!', response);
          });
    }
  },

  computed: {
    loadCarInfo() {
      return this.car;
    },

    loadPersonalInfo() {
      return this.personalInfo;
    },

    loadMessage() {
      return this.message;
    }
  }
}
</script>

<style>

</style>
