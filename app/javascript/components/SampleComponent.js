import React from 'react';
import { BarLoader } from 'react-spinners';

export default class SampleComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      loading: true
    }
  }
  render() {
    return (
      <div className='sweet-loading'>
        <BarLoader
          color={'#123abc'} 
          loading={this.state.loading} 
        />
      </div>
    )
  }
}